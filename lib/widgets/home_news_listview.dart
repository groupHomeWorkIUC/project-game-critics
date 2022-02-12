import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/news.dart';

class HomeNewsListView extends GetView {
  final List<News> homeNews;
  HomeNewsListView({Key? key, required this.homeNews}) : super(key: key);

  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 260,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: homeNews.length,
          itemBuilder: (context, index) {
            return buildNewsContainer(news: homeNews.elementAt(index));
          }),
    );
  }

  buildNewsContainer({News? news}) {
    String imageUrl;

    if (news != null && news.images!.isNotEmpty) {
      imageUrl = news.images!.first.link!;
    } else {
      imageUrl = Constants.blankImage;
    }

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (news != null) {
          homePageController.goToDetailsPage(news: news);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(Get.context!).size.width,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              news!.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(Get.context!).textTheme.headline2,
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: MediaQuery.of(Get.context!).size.width,
              child: Text(
                news.content!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(Get.context!).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
