import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesController extends GetxController {
  List<Game> games = [];
  String? title;

  @override
  void onInit() async {
    super.onInit();

    title = Get.arguments['company_name'];
    games = await GameRepository.getFilteredGames(Get.arguments['company_id']);
    update();
  }
}
