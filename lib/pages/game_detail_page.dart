import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/screen_controller/game_details_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GameDetailsPage extends GetView<GameDetailsController> {
  GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameDetailsController>(
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Visibility(
              visible: controller.game != null,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Image.network(controller.game!.images!.isEmpty
                            ? Constants.blankImage
                            : controller.game!.images!.first.link!),
                        const SizedBox(height: 20),
                        Text(
                          controller.game!.createdAt!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Row(
                          children: [
                            Text(
                              controller.game != null
                                  ? controller.game!.name!
                                  : '',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const Spacer(),
                            ReviewContainer(
                              review: 91,
                            )
                          ],
                        ),
                        Text(
                          controller.game!.content!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.game!.stores!.length,
                              itemBuilder: (context, index) {
                                return Image.network(
                                    controller.game!.stores!.isEmpty
                                        ? Constants.blankImage
                                        : controller.game!.stores!
                                            .elementAt(index)
                                            .imageLink!);
                              }),
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                            text: TranslateHelper.sendYourReview,
                            onPressed: () {}),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                  //     Positioned(bottom: 20, right: 0, child: buildViewContainer())
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /*Container buildViewContainer() {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: DarkThemeColors.redColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.remove_red_eye, color: Colors.white),
          const SizedBox(width: 5),
          Text(
            controller.game!.viewCount.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }*/

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Center(
          child: Text(
        (controller.game!.name!).toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(Get.context!).textTheme.headline2,
      )),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          splashRadius: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
          splashRadius: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark),
          splashRadius: 20,
        ),
      ],
    );
  }
}
