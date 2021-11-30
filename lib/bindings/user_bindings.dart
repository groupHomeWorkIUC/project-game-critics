import 'package:get/get.dart';
import 'package:project_game_critics/controllers/login_controller.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
