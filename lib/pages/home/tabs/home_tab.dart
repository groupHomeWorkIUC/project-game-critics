import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/tab_controllers/home_tab_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/image.dart';
import 'package:project_game_critics/widgets/home_news_listview.dart';
import 'package:project_game_critics/widgets/custom_input_fields/input_field.dart';
import 'package:project_game_critics/widgets/title_and_more_text.dart';

class HomeTab extends GetView<HomeTabController> {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeTabController>(builder: (_) {
      return SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 100),
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
              buildCompaniesListView(controller.companies),
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
                Game(images: [
                  ImageModel(
                      link:
                          'https://cdn1.epicgames.com/salesEvent/salesEvent/MetroExodus-PCEnhancedEdition_S2_1200x1600-64a550825c1427140460cc3a86cafdb5')
                ]),
                Game(images: [
                  ImageModel(
                      link:
                          'https://upload.wikimedia.org/wikipedia/tr/6/62/The_Last_of_Us_Part_II_cover_art.png')
                ]),
                Game(images: [
                  ImageModel(
                      link:
                          'https://cdn.vox-cdn.com/thumbor/V1qL4srH5jU6d2wLjtUtOrXSfQc=/0x0:3840x2160/1200x800/filters:focal(1574x364:2188x978)/cdn.vox-cdn.com/uploads/chorus_image/image/67762022/EmZ365SW8AEkLm0.0.jpeg')
                ])
              ]),
            ],
          ),
        ),
      );
    });
  }

  buildCompaniesListView(List<Company> company) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemCount: company.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(RouteConstants.gamesPage, arguments: {
                'company_id': company.elementAt(index).id,
                'company_name': company.elementAt(index).name
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                company.elementAt(index).imageLink!,
                width: 150,
                fit: BoxFit.cover,
              ),
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
          itemCount: popularGames.length,
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
