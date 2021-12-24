import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';

class CommentField extends StatelessWidget {
  final TextEditingController commentFieldController;
  final String? hintText;
  final IconData? inputFieldIcon;
  const CommentField(
      {Key? key,
      required this.commentFieldController,
      this.hintText,
      this.inputFieldIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: DarkThemeColors.secondaryBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        maxLines: 3,
        controller: commentFieldController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            Get.snackbar("Empty fields", "Please fill all input fields");
            return null;
          }
          return null;
        },
        style: TextStyle(
            color: DarkThemeColors.greyTextColor, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
