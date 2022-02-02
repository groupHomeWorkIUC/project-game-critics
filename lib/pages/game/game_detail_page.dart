import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/game/game_details_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/comment_container.dart';
import 'package:project_game_critics/widgets/custom_input_fields/comment_field.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GameDetailsPage extends GetView<GameDetailsController> {
  GameDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: buildGameDetail(context),
    );
  }

  buildGameDetail(BuildContext context) {
    return GetBuilder<GameDetailsController>(builder: (_) {
      return Padding(
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
                    controller.game!.releaseDate ?? '',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Row(
                    children: [
                      Text(
                        controller.game!.name ?? '',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const Spacer(),
                      ReviewContainer(
                        review: controller.game!.rating,
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
                  buildCommentForm(),
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
          ],
        ),
      );
    });
  }

  buildCommentListView() {
    return controller.comments != null
        ? GetBuilder<GameDetailsController>(builder: (_) {
            return ListView.separated(
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommentContainer(
                      comment: controller.comments!.elementAt(index));
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: controller.comments!.length);
          })
        : const SizedBox();
  }

  buildCommentTextField() {
    return CommentField(
      commentFieldController: controller.commentFieldController,
      hintText: 'Type your comment',
      inputFieldIcon: Icons.comment,
    );
  }

  buildCommentForm() {
    return Visibility(
      visible: UserController.isLoggedIn(),
      child: Form(
        key: controller.gameCommentFormKey,
        child: Column(
          children: [
            const Divider(
              thickness: 0.1,
              color: Colors.grey,
              height: 0.1,
            ),
            const SizedBox(height: 5),
            buildCommentTextField(),
            const SizedBox(height: 5),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: DarkThemeColors.redColor,
              ),
              unratedColor: Colors.white,
              onRatingUpdate: (rating) {
                controller.rating = rating;
              },
            ),
            const SizedBox(height: 10),
            PrimaryButton(
                text: 'Send Your Comment',
                onPressed: controller.onPressedSendComment),
            const SizedBox(height: 20),
          ],
        ),
      ),
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
