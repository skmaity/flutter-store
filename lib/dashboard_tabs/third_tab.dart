import 'package:animated_login/components/mycategory.dart';
import 'package:animated_login/pages/categories_page.dart';
import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  final int pageIndex;

  const ThirdTab({super.key, required this.pageIndex});

  void goingToCategoryPage(BuildContext context, String page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryPage(page: page),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: pageIndex == 1
          ? Column(
              children: [
                MyCategory(
                  IconPath: 'lib/assets/gicons/action.png',
                  title: "Action",
                  onTap: () {
                    goingToCategoryPage(context, "Action");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/adventure.png',
                  title: "Adventure",
                  onTap: () {
                    goingToCategoryPage(context, "Adventure");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/arcade.png',
                  title: "Arcade",
                  onTap: () {
                    goingToCategoryPage(context, "Arcade");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/board.png',
                  title: "Board",
                  onTap: () {
                    goingToCategoryPage(context, "Board");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/card.png',
                  title: 'Card',
                  onTap: () {
                    goingToCategoryPage(context, "Card");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/casual.png',
                  title: "Casual",
                  onTap: () {
                    goingToCategoryPage(context, "Casual");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/educational.png',
                  title: "Educational",
                  onTap: () {
                    goingToCategoryPage(context, "Educational");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/music.png',
                  title: "Music",
                  onTap: () {
                    goingToCategoryPage(context, "Music");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/puzzle.png',
                  title: 'Puzzle',
                  onTap: () {
                    goingToCategoryPage(context, "Puzzle");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/racing.png',
                  title: 'Racing',
                  onTap: () {
                    goingToCategoryPage(context, "Racing");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/simulation.png',
                  title: 'Simulation',
                  onTap: () {
                    goingToCategoryPage(context, "Simulation");
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/strategy.png',
                  title: 'Strategy',
                  onTap: () {
                    goingToCategoryPage(context, "Strategy");
                  },
                ),
                SizedBox(height: 80),
              ],
            )
          : Column(
              children: [
                MyCategory(
                  IconPath: 'lib/assets/gicons/art.png',
                  title: 'Art & Design',
                  onTap: () {
                    goingToCategoryPage(context, 'Art & Design');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/beauty.png',
                  title: 'Beauty',
                  onTap: () {
                    goingToCategoryPage(context, 'Beauty');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/communication.png',
                  title: 'Communication',
                  onTap: () {
                    goingToCategoryPage(context, 'Communication');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/dating.png',
                  title: 'Dating',
                  onTap: () {
                    goingToCategoryPage(context, 'Dating');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/educational.png',
                  title: 'Educational',
                  onTap: () {
                    goingToCategoryPage(context, 'Educational');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/entertainment.png',
                  title: 'Entertainment',
                  onTap: () {
                    goingToCategoryPage(context, 'Entertainment');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/finance.png',
                  title: 'Finance',
                  onTap: () {
                    goingToCategoryPage(context, 'Finance');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/food.png',
                  title: 'Food',
                  onTap: () {
                    goingToCategoryPage(context, 'Food');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/games.png',
                  title: 'Games',
                  onTap: () {
                    goingToCategoryPage(context, 'Games');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/health.png',
                  title: 'Health & Fitness',
                  onTap: () {
                    goingToCategoryPage(context, 'Health & Fitness');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/kids.png',
                  title: 'Kids',
                  onTap: () {
                    goingToCategoryPage(context, 'Kids');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/music.png',
                  title: 'Music',
                  onTap: () {
                    goingToCategoryPage(context, 'Music');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/photography.png',
                  title: 'Photography',
                  onTap: () {
                    goingToCategoryPage(context, 'Photography');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/shopping.png',
                  title: 'Shopping',
                  onTap: () {
                    goingToCategoryPage(context, 'Shopping');
                  },
                ),
                MyCategory(
                  IconPath: 'lib/assets/gicons/social.png',
                  title: 'Social',
                  onTap: () {
                    goingToCategoryPage(context, 'Social');
                  },
                ),
                SizedBox(height: 80,),
              ],
            ),
    );
  }
}
