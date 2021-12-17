import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GameDetailsController extends GetxController {
  Game? game;
  final data = Get.arguments;
  @override
  void onInit() async {
    super.onInit();
    String id = "1";
    game = await GameRepository.getGameDetails(id);
    update();
  }
}
