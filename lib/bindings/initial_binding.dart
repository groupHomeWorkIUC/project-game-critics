import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/splash_screen_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
    Get.put(SplashScreenController());
  }
}
