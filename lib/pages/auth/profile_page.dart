import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/profile_page_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

class ProfilePage extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: [
            buildContainer(TranslateHelper.logOut, Icons.logout,
                onPressed: controller.logOut),
          ],
        ),
      ),
    );
  }

  buildContainer(String? text, IconData? icon, {onPressed}) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: DarkThemeColors.secondaryBackgroundColor,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(icon!, color: DarkThemeColors.whiteTextColor),
              const SizedBox(width: 15),
              Text(
                text!,
                style: Theme.of(Get.context!).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
