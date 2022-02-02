import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/news/news_details_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/comment_container.dart';
import 'package:project_game_critics/widgets/custom_input_fields/comment_field.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';

class NewsDetailsPage extends GetView<NewsDetailsController> {
  const NewsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: buildNewsDetail(context),
    );
  }

  buildNewsDetail(BuildContext context) {
    return GetBuilder<NewsDetailsController>(
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Visibility(
            visible: controller.news != null,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: controller.news != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.news!.releaseDate ?? '',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text(
                              controller.news != null
                                  ? controller.news!.title!
                                  : '',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            const SizedBox(height: 20),
                            /*Hero(
                              tag: 'news' + controller.news!.id.toString(),
                              child: Image.network(
                                  controller.news!.images!.isEmpty
                                      ? Constants.blankImage
                                      : controller.news!.images!.first.link!),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              controller.news!.content ?? '',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),*/
                            Html(
                              data: controller.news!.content,
                              style: {
                                "img": Style(
                                  width: double.infinity,
                                ),
                                "p": Style(
                                  color: Colors.white,
                                  fontSize: FontSize.medium,
                                )
                              },
                            ),
                            const SizedBox(height: 20),
                            buildCommentForm(),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                TranslateHelper.comments,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(
                              thickness: 0.1,
                              color: Colors.grey,
                              height: 0.1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            buildCommentListView(),
                            const SizedBox(height: 100),
                          ],
                        )
                      : const SizedBox(),
                ),
                Positioned(bottom: 20, right: 0, child: buildViewContainer())
              ],
            ),
          ),
        );
      },
    );
  }

  Container buildViewContainer() {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: DarkThemeColors.redColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: controller.news != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.remove_red_eye, color: Colors.white),
                const SizedBox(width: 5),
                Text(
                  controller.news!.viewCount.toString(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          : const SizedBox(),
    );
  }

  buildCommentTextField() {
    return CommentField(
      commentFieldController: controller.commentFieldController,
      hintText: 'Type your comment',
      inputFieldIcon: Icons.comment,
    );
  }

  _buildAppBar() {
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

  buildCommentListView() {
    return controller.comments != null
        ? GetBuilder<NewsDetailsController>(builder: (_) {
            return ListView.separated(
                reverse: true,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CommentContainer(
                    comment: controller.comments!.elementAt(index),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: controller.comments!.length);
          })
        : const SizedBox();
  }

  buildCommentForm() {
    return Visibility(
      visible: UserController.isLoggedIn(),
      child: Form(
        key: controller.newsCommentFormKey,
        child: Column(
          children: [
            const Divider(
              thickness: 0.1,
              color: Colors.grey,
              height: 0.1,
            ),
            const SizedBox(height: 5),
            buildCommentTextField(),
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
}
