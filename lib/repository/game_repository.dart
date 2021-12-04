import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class GameRepository extends ApiProvider {
  static Future getGames() async {
    Response response = await ApiProvider.getResponse(ApiConstants.games);
    List<Game> gameList = [];
    for (var item in response.body) {
      gameList.add(Game.fromJson(item));
    }
    return gameList;
  }

  static Future getFilteredGames(int? id) async {
    Response response = await ApiProvider.getResponse(
      ApiConstants.games,
      query: {'company_id': id.toString()},
    );
    List<Game> gameList = [];
    for (var item in response.body) {
      gameList.add(Game.fromJson(item));
    }
    return gameList;
  }
}
