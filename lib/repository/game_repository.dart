import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class GameRepository extends ApiProvider {
  static Future getGames({String? page}) async {
    Response response =
        await ApiProvider.getResponse(ApiConstants.games, query: {
      'page': page ?? "1",
    });
    List<Game> gameList = [];
    for (var item in response.body['data']) {
      gameList.add(Game.fromJson(item));
    }
    return gameList;
  }

  static Future getGamesByName(String? name) async {
    Response response = await ApiProvider.getResponse(
      ApiConstants.games,
      query: {'name': name},
    );
    List<Game> gameList = [];
    for (var item in response.body['data']) {
      gameList.add(Game.fromJson(item));
    }
    return gameList;
  }

  static Future getFilteredGames(int? id, {String? page}) async {
    Response response = await ApiProvider.getResponse(
      ApiConstants.games,
      query: {
        'company_id': id.toString(),
        'page': page ?? "1",
      },
    );
    List<Game> gameList = [];
    for (var item in response.body['data']) {
      gameList.add(Game.fromJson(item));
    }
    return gameList;
  }

  static Future getGameDetails(String id) async {
    Response response =
        await ApiProvider.getResponse(ApiConstants.games + "/" + id.toString());
    Game game = Game.fromJson(response.body);
    return game;
  }
}
