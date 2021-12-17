import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/games_tab_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/home_tab_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/news_tab_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
    Get.put(HomeTabController());
    Get.put(GamesTabController());
    Get.put(NewsTabController());
  }
}
