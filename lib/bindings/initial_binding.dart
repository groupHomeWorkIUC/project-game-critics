import 'package:get/get.dart';
import 'package:project_game_critics/controllers/login_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}