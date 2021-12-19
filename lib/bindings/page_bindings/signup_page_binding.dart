import 'package:get/instance_manager.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/signup_page_controller.dart';

class SignupPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupPageController());
  }
}
