import 'package:animated_login/components/bottomnavbar.dart';
import 'package:animated_login/components/navigation_controller.dart';
import 'package:animated_login/dashboard_tabs/first_tab.dart';
import 'package:animated_login/components/glass_box.dart';
// import 'package:animated_login/pages/dash_board.dart';
import 'package:animated_login/components/search_box.dart';
import 'package:animated_login/dashboard_tabs/secend_tab.dart';
import 'package:animated_login/dashboard_tabs/third_tab.dart';

import 'package:animated_login/pages/games_page.dart';
import 'package:animated_login/pages/home_page.dart';
import 'package:animated_login/pages/settings_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

final user = FirebaseAuth.instance.currentUser!;
List <Widget>pages =[
  const HomePage(),
  const GamesPage(),
  const SettingsPage(),
];
var controller = Get.put(Navigation());

class _DashBoardState extends State<DashBoard> {
  _handleIndexChange(int index) {
    setState(() {
      controller.currentIndex = index;
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

        // backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset('lib/assets/fusionapps.png'),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,

          actions: [

            SearchBox(onTap: onSearch, text: 'Search Apps & Games'),
            SizedBox(width: 10,),
            //  IconButton(
            // onPressed: () {},
            // icon: const Icon(Icons.notifications_outlined)),
                        SizedBox(
                          width: 40,
                          child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(30),
              child: user.photoURL != null? Image(image: NetworkImage(user.photoURL!)): const Image(image: AssetImage('lib/assets/nodp.jpg')) ),
                        ), 
                        const SizedBox(width: 15,)
          ],
        ),
        body:Column(
          children: [
            controller.currentIndex !=2? const TabBar(
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
                  icon: Text('Categories'),
                ),
              ]
            ):const SizedBox(),
            pages[controller.currentIndex],
            Expanded(
              child: TabBarView(children: [
                FirstTab(pageIndex: controller.currentIndex),
                SecendTab(pageIndex: controller.currentIndex,),
                ThirdTab(pageIndex: controller.currentIndex)
                
              ]),
            )
          ],
        ),
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: 
           MyBottomNavbar(
                index: controller.currentIndex,
                onTap: _handleIndexChange,
              ),
        ),
      ),
    );
  }
}