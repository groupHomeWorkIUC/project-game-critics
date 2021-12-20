import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/screen_controller/game/game_details_controller.dart';
import 'package:project_game_critics/helpers/future_builder.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/comment_container.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GameDetailsPage extends GetView<GameDetailsController> {
  const GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilderData(
      future: controller.getGameDetail(),
      pageContent: buildGameDetail(context),
      conditions: true,
    );
  }

  GetBuilder<GameDetailsController> buildGameDetail(BuildContext context) {
    return GetBuilder<GameDetailsController>(
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                      AutoSizeText(
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        thickness: 0.1,
                        color: Colors.grey,
                        height: 0.1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildCommentListView(),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                //     Positioned(bottom: 20, right: 0, child: buildViewContainer())
              ],
            ),
          ),
        );
      },
    );
  }

  buildCommentListView() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const CommentContainer();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemCount: 5);
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
