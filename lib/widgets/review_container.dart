import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class ReviewContainer extends StatefulWidget {
  final num? review;
  const ReviewContainer({Key? key, this.review}) : super(key: key);

  @override
  _ReviewContainerState createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: widget.review!.toDouble(),
      starColor: DarkThemeColors.redColor,
      starCount: 5,
      starSize: 12,
      valueLabelVisibility: false,
    );
  }
}
