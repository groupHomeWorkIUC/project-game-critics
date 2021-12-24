import 'package:flutter/material.dart';

buildTitleAndMoreText(context, {required String title}) {
  return Row(
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    ],
  );
}
