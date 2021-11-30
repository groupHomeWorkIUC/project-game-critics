import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/home_page_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/image.dart';
import 'package:project_game_critics/widgets/home_news_listview.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/title_and_more_text.dart';

class HomePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (_) {
      return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInputField(
                    inputFieldText: TranslateHelper.searchForGames,
                    inputFieldIcon: Icons.search),
                const SizedBox(height: 20),
                buildTitleAndMoreText(context, title: TranslateHelper.news),
                const SizedBox(height: 10),
                // ignore: prefer_const_constructors
                HomeNewsListView(homeNews: controller.homeNews),
                const SizedBox(height: 20),
                Text(
                  TranslateHelper.companies,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 10),
                buildCompaniesListView([
                  'https://www.pngitem.com/pimgs/m/560-5604628_ubisoft-png-download-ubisoft-logo-vector-png-transparent.png',
                  'https://esportimes.com/wp-content/uploads/2020/06/rockstar-games-esportimes.jpg',
                  'https://esporlab.com/wp-content/uploads/2021/06/days-gone-gelistiricinden-yeni-playstation-5-oyunu-geliyor.jpeg',
                  'https://egamersworld.com/uploads/blog/1546870744203-1.jpg',
                  'https://leadergamer.com.tr/app/uploads/2021/08/blog_default-red.png',
                ]),
                const SizedBox(height: 20),
                Text(
                  TranslateHelper.popularGames,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 10),
                buildPopularGames([
                  Game(images: [
                    ImageModel(
                        link:
                            'https://upload.wikimedia.org/wikipedia/en/thumb/1/16/Days_Gone_cover_art.jpg/220px-Days_Gone_cover_art.jpg')
                  ]),
                ]),
              ],
            ),
          ),
        ),
      );
    });
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        'Game Critics',
        style: Theme.of(Get.context!).textTheme.headline4,
      ),
    );
  }

  buildCompaniesListView(List<String> companyUrl) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              companyUrl.elementAt(index),
              width: 100,
              fit: BoxFit.cover,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 15,
          );
        },
      ),
    );
  }

  buildPopularGames(List<Game> popularGames) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          itemCount: 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                popularGames.elementAt(index).images!.elementAt(0).link!,
                width: 100,
                fit: BoxFit.cover,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 15,
            );
          }),
    );
  }
}
