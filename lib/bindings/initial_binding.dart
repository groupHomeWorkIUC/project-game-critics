import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController(), permanent: true);
    Get.put(UserController(), permanent: true);
  }
}
