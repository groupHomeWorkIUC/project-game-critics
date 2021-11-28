import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/home_news.dart';

class HomeNewsListView extends StatefulWidget {
  const HomeNewsListView({Key? key}) : super(key: key);

  @override
  _HomeNewsListViewState createState() => _HomeNewsListViewState();
}

class _HomeNewsListViewState extends State<HomeNewsListView> {
  @override
  Widget build(BuildContext context) {
    HomeNews homeNews = HomeNews(
        imageUrl:
            'https://img.donanimhaber.com/images/haber/141280/src/forza-horizon-5-daha-cikmadan-muthis-bir-basari-yakaladi141280_0.jpg',
        title: 'Deneme',
        content: 'Deneme');
    // ignore: sized_box_for_whitespace
    return Container(
      height: 250,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return buildNewsContainer(news: homeNews);
          }),
    );
  }

  buildNewsContainer({HomeNews? news}) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: DarkThemeColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(news!.imageUrl!),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            news.title!,
            style: Theme.of(context).textTheme.caption,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              news.content!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ],
      ),
    );
  }
}
