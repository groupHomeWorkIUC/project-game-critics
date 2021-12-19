import 'package:get/instance_manager.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/profile_page_controller.dart';

class ProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfilePageController());
  }
}
