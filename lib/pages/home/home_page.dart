import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/pages/home/tabs/home_tab.dart';
import 'package:project_game_critics/pages/home/tabs/games_tab.dart';
import 'package:project_game_critics/pages/home/tabs/news_tab.dart';
import 'package:project_game_critics/widgets/custom_bottom_navbar/custom_bottom_navbar.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (_) {
      return Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
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
                          isCurrentPage: controller.tabController.index == 0,
                          onPressed: () {
                            controller.animateToPage(0);
                          }),
                      buildIconButtonWithLabel(
                          iconData: Icons.gamepad_rounded,
                          isCurrentPage: controller.tabController.index == 1,
                          onPressed: () {
                            controller.animateToPage(1);
                          }),
                      buildIconButtonWithLabel(
                          iconData: Icons.article_rounded,
                          isCurrentPage: controller.tabController.index == 2,
                          onPressed: () {
                            controller.animateToPage(2);
                          }),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      );
    });
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        Constants.appName,
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
