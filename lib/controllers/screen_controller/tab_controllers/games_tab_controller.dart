import 'package:get/get.dart';
import 'package:project_game_critics/helpers/logger.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesTabController extends GetxController {
  List<Game> games = [];

  Future getGames() async {
    if (games.isEmpty) {
      games = await GameRepository.getGames();
      LogHelper.infoLog(games.first.name);
    }
    return games;
  }
}
