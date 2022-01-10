import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/search_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/widgets/custom_input_fields/input_field.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class SearchTab extends GetView<SearchController> {
  const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (_) {
      return Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          height: 200,
          child: Column(
            children: [
              buildSearchField(),
              buildSearchListView(),
              const SizedBox(height: 100),
            ],
          ));
    });
  }

  buildSearchField() {
    return Column(
      children: [
        CustomInputField(
            controller: controller.searchFieldController,
            inputFieldText: TranslateHelper.searchForGames,
            inputFieldIcon: Icons.search),
        const SizedBox(height: 20),
      ],
    );
  }

  buildSearchListView() {
    return Expanded(
      child: LazyLoadScrollView(
        onEndOfPage: controller.getMoreGames,
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 5);
          },
          itemBuilder: (context, index) {
            return buildSearchResultContainer(
                game: controller.games.elementAt(index));
          },
          itemCount: controller.games.length,
        ),
      ),
    );
  }

  buildSearchResultContainer({Game? game}) {
    return game != null
        ? InkWell(
            onTap: () {
              controller.goToGameDetailsPage(game);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: DarkThemeColors.secondaryBackgroundColor,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: Image.network(
                      game.images != null
                          ? game.images!.first.link!
                          : Constants.blankImage,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    game.name ?? '',
                    style: Theme.of(Get.context!).textTheme.subtitle2,
                  ),
                  const Spacer(),
                  ReviewContainer(
                    review: game.rating,
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
