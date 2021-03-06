import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/games_tab_controller.dart';
import 'package:project_game_critics/widgets/games_container.dart';

class GamesTab extends GetView<GamesTabController> {
  const GamesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  buildGamesList();
  }

  buildGamesList() {
    return GetBuilder<GamesTabController>(builder: (_) {
      return Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: LazyLoadScrollView(
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
            onEndOfPage: controller.getMoreGames,
          ));
    });
  }
}
