import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/models/news.dart';

class NewsContainer extends StatelessWidget {
  final News? news;
  const NewsContainer({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            news!.images == null || news!.images!.isEmpty ? Constants.blankImage : news!.images!.first.link!,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 10),
          Text(
            news!.title ?? "",
            style: Theme.of(context).textTheme.headline2,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Html(
            data: news!.content!.substring(0, news!.content!.length < 250 ? news!.content!.length : 250) + "...",
            tagsList: Html.tags..remove('img'),
            style: {
              "body": Style(
                margin: EdgeInsets.zero,
                fontSize: FontSize(Theme.of(Get.context!).textTheme.bodyText1!.fontSize),
                fontWeight: Theme.of(Get.context!).textTheme.bodyText1!.fontWeight,
                color: Theme.of(Get.context!).textTheme.bodyText1!.color,
              ),
            },
          ),
          /*Text(
            news!.content!,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),*/
        ],
      ),
    );
  }
}
