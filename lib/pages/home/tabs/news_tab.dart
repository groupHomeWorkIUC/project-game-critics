import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/news_tab_controller.dart';
import 'package:project_game_critics/widgets/news_container.dart';

class NewsTab extends GetView<NewsTabController> {
  const NewsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildNews();
  }

  buildNews() {
    return GetBuilder<NewsTabController>(builder: (_) {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: LazyLoadScrollView(
          onEndOfPage: controller.getMoreNews,
          child: ListView.separated(
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: controller.newsList.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    controller.onClickNews(
                        news: controller.newsList.elementAt(index));
                  },
                  child: NewsContainer(
                      news: controller.newsList.elementAt(index)));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
          ),
        ),
      );
    });
  }
}
