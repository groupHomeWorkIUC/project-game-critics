import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/news.dart';

class HomePageController extends GetxController
    with SingleGetTickerProviderMixin {
  late TabController tabController;
  late List<Widget> tabBarPages;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
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
}
