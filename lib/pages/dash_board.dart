import 'package:animated_login/components/bottomnavbar.dart';
import 'package:animated_login/components/first_tab.dart';
import 'package:animated_login/components/glass_box.dart';
// import 'package:animated_login/pages/dash_board.dart';
import 'package:animated_login/components/search_box.dart';
import 'package:animated_login/components/secend_tab.dart';
import 'package:animated_login/components/third_tab.dart';

import 'package:animated_login/pages/games_page.dart';
import 'package:animated_login/pages/home_page.dart';
import 'package:animated_login/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

int _currentIndex = 0;
final user = FirebaseAuth.instance.currentUser!;
// final String? photoUrl = user.photoURL;
List <Widget>pages =[
  const HomePage(),
  const GamesPage(),
  const SettingsPage()
];

class _DashBoardState extends State<DashBoard> {
  _handleIndexChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
   onSearch() {
    showSearch(context: context, delegate: CustomSearchDelegate());
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Center(
              child: Row(
                children: [
                  SearchBox(onTap: onSearch, text: 'Search Apps & Games'),
                   IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined)),
              SizedBox(
                width: 40,
                child: ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(30),
                    child: Image(image: NetworkImage(user.photoURL!))),
              ), 
              const SizedBox(width: 20,)
                ],
              ),
              
            )
          ],
        ),
        body:Column(
          children: [
            _currentIndex !=2? const TabBar(
              automaticIndicatorColorAdjustment: true,
              tabs:
              [
                Tab(
                  icon: Text('For you'),
                ),
                 Tab(
                  icon: Text('Top chart'),
                ),
                 Tab(
                  icon: Text('Premium'),
                ),
              ]
            ):const SizedBox(),
            pages[_currentIndex],
            Expanded(
              child: TabBarView(children: [
                FirstTab(pageIndex: _currentIndex),
                SecendTab(pageIndex: _currentIndex,),
                ThirdTab(pageIndex: _currentIndex)
                
              ]),
            )
          ],
        ),
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: 
           MyBottomNavbar(
                index: _currentIndex,
                onTap: _handleIndexChange,
              ),
        ),
      ),
    );
  }
}