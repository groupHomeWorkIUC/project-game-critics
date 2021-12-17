import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/games_tab_controller.dart';
import 'package:project_game_critics/widgets/games_container.dart';

class GamesTab extends GetView<GamesTabController> {
  const GamesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GamesTabController>(builder: (_) {
      return GridView.count(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          children: List.generate(controller.games.length, (index) {
            return GamesContainer(game: controller.games.elementAt(index));
          }));
    });
  }
}
