import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GameDetailsController extends GetxController {
  Game? game = Game();
  final data = Get.arguments;

  Future getGameDetail() async {
    game = await GameRepository.getGameDetails(data['gameId'].toString());

    return game;
  }
}
