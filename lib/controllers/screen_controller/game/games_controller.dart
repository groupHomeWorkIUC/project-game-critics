import 'package:get/get.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GamesController extends GetxController {
  List<Game> games = [];
  String? title;
  int? companyId;

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
    return games;
  }
}
