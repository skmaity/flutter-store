import 'package:flutter/material.dart';

class MyBottomNavbar extends StatelessWidget {
  final int index;
  final Function(int) onTap;
  const MyBottomNavbar({super.key, required this.index, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
        onDestinationSelected: onTap,
        selectedIndex: index,
        shadowColor: Colors.cyan,
        backgroundColor: Colors.transparent,
        height: 80,
        elevation: 0,
        // indicatorColor: const Color.fromARGB(255, 53, 48, 48).withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.games), label: 'Games'),
          NavigationDestination(
              icon: Icon(Icons.menu_rounded), label: 'Manage'),
        ]);
  }
}
