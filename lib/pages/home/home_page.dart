import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/home_page_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/pages/home/tabs/home_tab.dart';
import 'package:project_game_critics/pages/home/tabs/games_tab.dart';
import 'package:project_game_critics/pages/home/tabs/news_tab.dart';
import 'package:project_game_critics/widgets/custom_bottom_navbar/custom_bottom_navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late List<Widget> tabBarPages;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                HomeTab(),
                GamesTab(),
                NewsTab(),
              ]),
          Positioned(
            bottom: 0,
            left: 60,
            right: 60,
            child: GetBuilder<HomePageController>(
              builder: (controller) {
                return CustomBottomNavBar(
                  iconButtons: [
                    buildIconButtonWithLabel(
                        iconData: Icons.home_filled,
                        isCurrentPage: tabController.index == 0,
                        onPressed: () {
                          controller.animateToPage(tabController, 0);
                        }),
                    buildIconButtonWithLabel(
                        iconData: Icons.gamepad_rounded,
                        isCurrentPage: tabController.index == 1,
                        onPressed: () {
                          controller.animateToPage(tabController, 1);
                        }),
                    buildIconButtonWithLabel(
                        iconData: Icons.article_rounded,
                        isCurrentPage: tabController.index == 2,
                        onPressed: () {
                          controller.animateToPage(tabController, 2);
                        }),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'Game Critics',
        style: Theme.of(Get.context!).textTheme.headline4,
      ),
    );
  }

  buildIconButtonWithLabel(
      {required IconData iconData,
      required Function() onPressed,
      bool? isCurrentPage}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: isCurrentPage! ? Colors.white : DarkThemeColors.backgroundColor,
      ),
      color: Colors.white,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}
