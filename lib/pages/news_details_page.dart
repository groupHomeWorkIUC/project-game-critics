import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/screen_controller/news_details_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class NewsDetailsPage extends GetView<NewsDetailsController> {
  NewsDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsDetailsController>(
      builder: (_) {
        return Scaffold(
          appBar: _buildAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Visibility(
              visible: controller.news != null,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.news!.createdAt!,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          controller.news != null
                              ? controller.news!.title!
                              : '',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 20),
                        Image.network(controller.news!.images!.isEmpty
                            ? Constants.blankImage
                            : controller.news!.images!.first.link!),
                        const SizedBox(height: 20),
                        Text(
                          controller.news!.content!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                  Positioned(bottom: 20, right: 0, child: buildViewContainer())
                ],
              ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.remove_red_eye, color: Colors.white),
          const SizedBox(width: 5),
          Text(
            controller.news!.viewCount.toString(),
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
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
}
