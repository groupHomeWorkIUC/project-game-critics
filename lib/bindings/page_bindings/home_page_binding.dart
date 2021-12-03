import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
  }
}
