import 'package:get/get.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesTabController extends GetxController {
  List<Game> games = [];
  int page = 1;

  Future getMoreGames() async {
    page += 1;
    games += await GameRepository.getGames();
    update();
  }

  Future getGames() async {
    if (games.isEmpty) {
      games = await GameRepository.getGames();
    }
    return games;
  }
}
