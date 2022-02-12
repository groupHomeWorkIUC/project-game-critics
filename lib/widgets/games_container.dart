import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GamesContainer extends StatelessWidget {
  final Game? game;
  const GamesContainer({Key? key, this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Get.toNamed(RouteConstants.gameDetailsPage, arguments: {'gameId': game!.id});
      },
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Image.network(
                game!.images!.first.link ?? Constants.blankImage,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      game!.name!,
                      style: Theme.of(context).textTheme.headline2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ReviewContainer(
                    review: game!.rating ?? 1,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                game!.content!,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
