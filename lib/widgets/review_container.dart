import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class ReviewContainer extends StatefulWidget {
  final int? review;
  const ReviewContainer({Key? key, this.review}) : super(key: key);

  @override
  _ReviewContainerState createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: DarkThemeColors.redColor,
      ),
      child: Center(
        child: Text(
          widget.review == null ? "0" : widget.review.toString(),
          style: Theme.of(context).textTheme.overline,
        ),
      ),
    );
  }
}
