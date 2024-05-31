import 'package:animated_login/onBording/intro_page1.dart';
import 'package:animated_login/onBording/intro_page2.dart';
import 'package:animated_login/onBording/intro_page3.dart';
import 'package:animated_login/pages/auth_page.dart';
// import 'package:animated_login/pages/login.dart';
// import 'package:animated_login/pages/login_or_register.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final PageController _controller = PageController();
  bool lastPage = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
              lastPage = (index == 2);
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                    TextButton(
                      onPressed: (){
                      _controller.jumpToPage(2);
                    }, child: const Text('skip')),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3),

                  lastPage ?
                    TextButton(
                      onPressed: (){

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthPage(),));
                    }, child: const Text('done'))
                    : 
                    TextButton(
                      onPressed: (){
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve:Curves.easeIn);

                    }, child: const Text('next'))
                    
                ],
              ),
          )
        ],
      ),
    );
  }
}
