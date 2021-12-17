import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class NewsTabController extends GetxController {
  List<News> newsList = [];

  @override
  void onInit() async {
    super.onInit();
    newsList = await NewsRepository.getHomeNews();
    update();
  }

  void onClickNews({required News news}) {
    Get.toNamed(RouteConstants.newsDetailsPage, arguments: {'news': news});
  }
}
