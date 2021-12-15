import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

class PasswordField extends GetView {
  final TextEditingController? textEditingController;
  final String? initialValue;
  const PasswordField({Key? key, this.textEditingController, this.initialValue})
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
        controller: textEditingController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            Get.snackbar("Empty password fields", "Please type your password");
            return null;
          }
          return null;
        },
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(
            color: DarkThemeColors.greyTextColor, fontWeight: FontWeight.w300),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: TranslateHelper.password,
          icon: Icon(
            Icons.lock,
            color: DarkThemeColors.greyTextColor,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
