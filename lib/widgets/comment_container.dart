import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 15,
        ),
        //const SizedBox(width: 5),
        const Spacer(),
        buildCommentSection(),
      ],
    );
  }

  buildCommentSection({
    String? comment,
    String? name,
    int? rating,
  }) {
    return Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                name ?? 'No name',
                style: Theme.of(Get.context!).textTheme.subtitle1,
              ),
              
            ],
          ),
          AutoSizeText(
            comment ?? 'This user has no comment on this game!',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(Get.context!).textTheme.bodyText2,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      width: MediaQuery.of(Get.context!).size.width * 0.8,
      decoration: BoxDecoration(
        color: DarkThemeColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
