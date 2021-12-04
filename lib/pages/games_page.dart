import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/games_controller.dart';
import 'package:project_game_critics/widgets/games_container.dart';

class GamesPage extends GetView<GamesController> {
  const GamesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetBuilder<GamesController>(builder: (_) {
        return GridView.count(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 100),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: controller.games.length < 2 ? 1 : 2,
            childAspectRatio: 2 / 3,
            children: List.generate(controller.games.length, (index) {
              return GamesContainer(game: controller.games.elementAt(index));
            }));
      }),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
          splashRadius: 20,
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back)),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt),
          splashRadius: 20,
        ),
      ],
    );
  }
}
