import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/login_page_controller.dart';

class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginPageController());
  }
}
