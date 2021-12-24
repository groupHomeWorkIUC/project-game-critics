import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/constants/enums.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/pages/home/tabs/home_tab.dart';
import 'package:project_game_critics/pages/home/tabs/games_tab.dart';
import 'package:project_game_critics/pages/home/tabs/news_tab.dart';
import 'package:project_game_critics/pages/home/tabs/search_tab.dart';
import 'package:project_game_critics/widgets/custom_bottom_navbar.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (_) {
      return GestureDetector(
        onTap: controller.onTapOutside,
        child: Scaffold(
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
                    SearchTab(),
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
                              controller
                                  .animateToPage(HomeTabPages.homeTab.index);
                            }),
                        buildIconButtonWithLabel(
                            iconData: Icons.gamepad_rounded,
                            isCurrentPage: controller.tabController.index == 1,
                            onPressed: () {
                              controller
                                  .animateToPage(HomeTabPages.gamesTab.index);
                            }),
                        buildIconButtonWithLabel(
                            iconData: Icons.article_rounded,
                            isCurrentPage: controller.tabController.index == 2,
                            onPressed: () {
                              controller
                                  .animateToPage(HomeTabPages.newsTab.index);
                            }),
                        buildIconButtonWithLabel(
                            iconData: Icons.search,
                            isCurrentPage: controller.tabController.index == 3,
                            onPressed: () {
                              controller
                                  .animateToPage(HomeTabPages.searchTab.index);
                            }),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
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
      actions: [
        Visibility(
          visible: UserController.isLoggedIn(),
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: const CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/photos/lion-picture-id899748204?k=20&m=899748204&s=612x612&w=0&h=8hCssaAkJ0FMBpnc6_lE7-7eEGhvTf_Pa_rjojszlbg="),
            ),
            onTap: controller.goToProfilePage,
          ),
        ),
        Visibility(
          visible: !UserController.isLoggedIn(),
          child: IconButton(
              onPressed: controller.goToLogin, icon: const Icon(Icons.login)),
        ),
        const SizedBox(width: 20),
      ],
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
