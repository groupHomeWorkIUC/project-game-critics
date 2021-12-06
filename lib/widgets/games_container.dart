import 'package:flutter/material.dart';
import 'package:project_game_critics/constants/constants.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GamesContainer extends StatefulWidget {
  final Game? game;
  final bool? isAlone;
  const GamesContainer({Key? key, this.game, this.isAlone}) : super(key: key);

  @override
  _GamesContainerState createState() => _GamesContainerState();
}

class _GamesContainerState extends State<GamesContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: DarkThemeColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Image.network(
              widget.game!.images!.first.link ?? Constants.blankImage,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  widget.game!.name!,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 10),
                const ReviewContainer(
                  review: 91,
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.game!.content!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
