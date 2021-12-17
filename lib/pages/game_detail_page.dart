import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/screen_controller/game_details_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GameDetailsPage extends GetView<GameDetailsController> {
  const GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameDetailsController>(
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Visibility(
              visible: !controller.isLoading,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Image.network(controller.game!.images == null
                            ? Constants.blankImage
                            : controller.game!.images!.first.link!),
                        const SizedBox(height: 20),
                        Text(
                          controller.game!.createdAt ?? '',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Row(
                          children: [
                            Text(
                              controller.game!.name ?? '',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const Spacer(),
                            const ReviewContainer(
                              review: 91,
                            )
                          ],
                        ),
                        Text(
                          controller.game!.content ?? '',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 20),
                        /*SizedBox(
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
                        ),*/
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

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Center(
          child: Text(
        (controller.game!.name ?? '').toUpperCase(),
        textAlign: TextAlign.center,
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
