import 'package:get/get.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/home_repository.dart';

class HomePageController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  List<News> homeNews = [];
  List<Game> popularGames = [];

  @override
  void onInit() async {
    super.onInit();
    homeNews = await homeRepository.getHomeNews();
    update();
  }
}
