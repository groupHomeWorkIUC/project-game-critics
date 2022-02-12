import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/models/comment.dart';

class CommentContainer extends StatelessWidget {
  final Comment? comment;

  const CommentContainer({Key? key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://media.istockphoto.com/photos/lion-picture-id899748204?k=20&m=899748204&s=612x612&w=0&h=8hCssaAkJ0FMBpnc6_lE7-7eEGhvTf_Pa_rjojszlbg="),
          radius: 15,
        ),
        //const SizedBox(width: 5),
        const Spacer(),
        buildCommentSection(),
      ],
    );
  }

  buildCommentSection() {
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                comment!.user!.name ?? '',
                style: Theme.of(Get.context!).textTheme.headline3,
              ),
              const Spacer(),
              comment!.rating != null
                  ? RatingStars(
                      starSize: 12,
                      starColor: Theme.of(Get.context!).primaryColor,
                      value: comment!.rating!.toDouble(),
                      valueLabelVisibility: false,
                      starCount: 5,
                    )
                  : const SizedBox(),
            ],
          ),
          AutoSizeText(
            comment!.content ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(Get.context!).textTheme.subtitle2,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      width: MediaQuery.of(Get.context!).size.width * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
