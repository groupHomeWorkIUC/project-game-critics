import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class SearchController extends GetxController {
  TextEditingController searchFieldController = TextEditingController();
  List<Game> games = [];

  @override
  void onInit() async {
    super.onInit();
    searchFieldController.addListener(getGamesList);
  }

  @override
  void onClose() {
    super.onClose();
    searchFieldController.dispose();
  }

  void getGamesList() async {
    if (searchFieldController.text != '') {
      games =
          await GameRepository.getGamesByName(searchFieldController.value.text);
    } else {
      games = [];
    }
    update();
  }

  void goToGameDetailsPage(Game game) {
    Get.toNamed(RouteConstants.gameDetailsPage, arguments: {'gameId': game.id});
  }
}
