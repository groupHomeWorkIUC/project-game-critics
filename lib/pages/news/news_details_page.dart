import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/widgets.dart';
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
        return controller.isLoading
            ? ConstantWidgets.circularProgressIndicator
            : Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.news!.releaseDate ?? '',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          controller.news != null ? controller.news!.title! : '',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(height: 20),
                        Html(
                          data: controller.news!.content,
                          style: {
                            "body": Style(
                              margin: EdgeInsets.zero,
                              fontSize: FontSize(Theme.of(Get.context!).textTheme.bodyText1!.fontSize),
                              fontWeight: Theme.of(Get.context!).textTheme.bodyText1!.fontWeight,
                              color: Theme.of(Get.context!).textTheme.bodyText1!.color,
                            ),
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
                    )),
                    Positioned(bottom: 20, right: 0, child: buildViewContainer())
                  ],
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
        color: Theme.of(Get.context!).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: controller.news != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: Theme.of(Get.context!).iconTheme.color,
                ),
                const SizedBox(width: 5),
                Text(
                  controller.news!.viewCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
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
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share),
          splashRadius: 20,
          color: Theme.of(Get.context!).iconTheme.color,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark),
          splashRadius: 20,
          color: Theme.of(Get.context!).iconTheme.color,
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
            PrimaryButton(text: 'Send Your Comment', onPressed: controller.onPressedSendComment),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
