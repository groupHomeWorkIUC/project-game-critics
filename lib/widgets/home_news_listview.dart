import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/news.dart';

class HomeNewsListView extends StatefulWidget {
  final List<News> homeNews;
  const HomeNewsListView({Key? key, required this.homeNews}) : super(key: key);

  @override
  _HomeNewsListViewState createState() => _HomeNewsListViewState();
}

class _HomeNewsListViewState extends State<HomeNewsListView> {
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
          itemCount: widget.homeNews.length,
          itemBuilder: (context, index) {
            return buildNewsContainer(news: widget.homeNews.elementAt(index));
          }),
    );
  }

  buildNewsContainer({News? news}) {
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
                image: NetworkImage(news!.images!.first.link!),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            news.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
