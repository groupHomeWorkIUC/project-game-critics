import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class NewsTabController extends GetxController {
  List<News> newsList = [];
  int page = 1;

  void onClickNews({required News news}) {
    Get.toNamed(RouteConstants.newsDetailsPage, arguments: {'news': news});
  }

  Future getMoreNews() async {
    page += 1;
    newsList += await NewsRepository.getHomeNews(page: page.toString());
    update();
  }

  @override
  onInit() async {
    super.onInit();
    if (newsList.isEmpty) {
      newsList = await NewsRepository.getHomeNews(page: page.toString());
    }
    update();
  }
}
