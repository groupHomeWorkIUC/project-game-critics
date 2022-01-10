import 'package:get/get.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesController extends GetxController {
  List<Game> games = [];
  String? title;
  int? companyId;
  int page = 1;

  @override
  void onInit() async {
    super.onInit();

    title = Get.arguments['company_name'];
    companyId = Get.arguments['company_id'];
  }

  Future getGames() async {
    if (games.isEmpty) {
      games = await GameRepository.getFilteredGames(companyId);
    }
    update();
    return games;
  }

  Future getMoreGames() async {
    page += 1;
    games +=
        await GameRepository.getFilteredGames(companyId, page: page.toString());
    update();
  }
}
