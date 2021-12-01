import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/widgets/review_container.dart';

class GamesContainer extends StatefulWidget {
  final Game? game;
  const GamesContainer({Key? key, this.game}) : super(key: key);

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
            flex: 4,
            child: Image.network(
              widget.game!.images!.first.link ??
                  'https://upload.wikimedia.org/wikipedia/commons/6/6a/A_blank_flag.png',
              fit: BoxFit.fitHeight,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 1,
            child: Text(
              widget.game!.name!,
              style: Theme.of(context).textTheme.subtitle1,
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
          const SizedBox(height: 5),
          Expanded(
              child: Row(
            children: const [
              Spacer(),
              ReviewContainer(
                review: 91,
              )
            ],
          ))
        ],
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/game.dart';

class GamesContainer extends StatefulWidget {
  final Game? game;
  const GamesContainer({Key? key, this.game}) : super(key: key);

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
          Image.network(
            widget.game!.images!.first.link!,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            widget.game!.name!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 10),
          Text(
            widget.game!.content!,
            style: Theme.of(context).textTheme.subtitle2,
          )
        ],
      ),
    );
  }
}
*/ 