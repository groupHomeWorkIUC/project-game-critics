import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/company_repository.dart';
import 'package:project_game_critics/repository/game_repository.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class HomePageController extends GetxController {
  List<News> homeNews = [];
  List<Company> companies = [];
  List<Game> games = [];

  @override
  void onInit() async {
    super.onInit();
    homeNews = await NewsRepository.getHomeNews();
    companies = await CompanyRepository.getCompanies();
    games = await GameRepository.getGames();
    update();
  }

  void animateToPage(TabController tabController, int pageIndex) {
    tabController.animateTo(pageIndex);
    update();
  }

  void goToDetailsPage({required News news}) {
    Get.toNamed(RouteConstants.newsDetailsPage, arguments: {'news': news});
  }
}
