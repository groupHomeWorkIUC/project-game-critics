import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/games_tab_controller.dart';
import 'package:project_game_critics/helpers/future_builder.dart';
import 'package:project_game_critics/widgets/games_container.dart';

class GamesTab extends GetView<GamesTabController> {
  const GamesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilderData(
      future: controller.getGames(),
      pageContent: buildGamesList(),
      conditions: (controller.games.isEmpty),
    );
  }

  buildGamesList() {
    return GetBuilder<GamesTabController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 100),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemBuilder: (context, index) {
            return GamesContainer(game: controller.games.elementAt(index));
          },
          itemCount: controller.games.length,
        ),
      );
    });
  }
}
