import 'package:get/get.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesTabController extends GetxController {
  List<Game> games = [];

  @override
  void onInit() async {
    super.onInit();
    games = await GameRepository.getGames();
    update();
  }
}
