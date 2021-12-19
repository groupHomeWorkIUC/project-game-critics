import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/game/game_details_controller.dart';

class GameDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GameDetailsController());
  }
}
