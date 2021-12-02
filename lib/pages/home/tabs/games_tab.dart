import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/widgets/games_container.dart';

class GamesTab extends StatefulWidget {
  const GamesTab({Key? key}) : super(key: key);

  @override
  _GamesTabState createState() => _GamesTabState();
}

class _GamesTabState extends State<GamesTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
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
