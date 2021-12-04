import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesController extends GetxController {
  List<Game> games = [];

  @override
  void onInit() async {
    super.onInit();

    games = await GameRepository.getFilteredGames(Get.arguments['company_id']);
    update();
  }
}
