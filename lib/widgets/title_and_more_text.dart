import 'package:flutter/material.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

buildTitleAndMoreText(context, {required String title}) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      const Spacer(),
      Text(
        TranslateHelper.more,
        style: Theme.of(context).textTheme.subtitle2,
      ),
      const Icon(
        Icons.arrow_right_rounded,
        color: Colors.white,
        size: 20,
      )
    ],
  );
}
