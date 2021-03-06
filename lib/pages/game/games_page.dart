import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/game/games_controller.dart';
import 'package:project_game_critics/widgets/games_container.dart';

class GamesPage extends GetView<GamesController> {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:  buildGames(),
    );
  }

  buildGames() {
    return GetBuilder<GamesController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
            itemCount: controller.games.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return GamesContainer(
                game: controller.games.elementAt(index),
              );
            }),
      );
    });
  }

  buildAppBar() {
    return AppBar(
      title: Center(child: Text(controller.title!.toUpperCase())),
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
          splashRadius: 20,
          color: Theme.of(Get.context!).iconTheme.color,
        ),
      ],
    );
  }
}
