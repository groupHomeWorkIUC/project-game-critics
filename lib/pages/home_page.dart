import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/home_news_listview.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/title_and_more_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              HomeNewsListView(),
              const SizedBox(height: 20),
              Text(
                TranslateHelper.organizations,
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
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      title: Text(
        'Game Critics',
        style: Theme.of(context).textTheme.headline4,
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
}
