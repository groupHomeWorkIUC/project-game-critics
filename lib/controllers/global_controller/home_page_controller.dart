import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/enums.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/search_controller.dart';
import 'package:project_game_critics/models/news.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  late List<Widget> tabBarPages;

  @override
  void onInit() {
    super.onInit();
    tabController =
        TabController(length: HomeTabPages.values.length, vsync: this);
  }

  void animateToPage(int pageIndex) {
    tabController.animateTo(pageIndex);
    update();
  }

  void goToDetailsPage({required News news}) {
    Get.toNamed(RouteConstants.newsDetailsPage, arguments: {'news': news});
  }

  void goToProfilePage() {
    Get.toNamed(RouteConstants.profilePage);
  }

  void goToLogin() {
    Get.offAllNamed(RouteConstants.login);
  }

  void onTapOutside() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (Get.find<SearchController>().searchFieldController.text == '') {
      Get.find<SearchController>().games = [];
      Get.find<SearchController>().update();
    }
  }
}
