import 'package:get/instance_manager.dart';
import 'package:project_game_critics/controllers/screen_controller/game/games_controller.dart';

class GamesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GamesController());
  }
}
