import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/news.dart';

class NewsContainer extends StatelessWidget {
  final News? news;
  const NewsContainer({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: DarkThemeColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Hero(
            tag: 'news' + news!.id.toString(),
            child: Image.network(
              news!.images!.first.link!,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            news!.title!,
            style: Theme.of(context).textTheme.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            news!.content!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
