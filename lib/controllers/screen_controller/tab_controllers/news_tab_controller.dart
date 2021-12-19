import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class NewsTabController extends GetxController {
  List<News> newsList = [];

  void onClickNews({required News news}) {
    Get.toNamed(RouteConstants.newsDetailsPage, arguments: {'news': news});
  }

  Future getNews() async {
    if (newsList.isEmpty) {
      newsList = await NewsRepository.getHomeNews();
    }
    return newsList;
  }
}
