import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/profile_page_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

class ProfilePage extends GetView<ProfilePageController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetBuilder<ProfilePageController>(
        builder: (_) {
          return Container(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              children: [
                buildContainer(TranslateHelper.informationProfile, Icons.person, onPressed: controller.profileInfo),
                const SizedBox(height: 5),
                buildThemeSwitch(),
                const SizedBox(height: 5),
                buildContainer(TranslateHelper.logOut, Icons.logout, onPressed: controller.logOut),
              ],
            ),
          );
        },
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
        margin: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(icon!, color: Colors.white),
              const SizedBox(width: 15),
              Text(
                text!,
                style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        TranslateHelper.profilePage,
        textAlign: TextAlign.center,
      ),
    );
  }

  buildThemeSwitch() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.dark_mode, color: Colors.white),
          const SizedBox(width: 15),
          Text(
            "Theme",
            style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          FlutterSwitch(
            value: Storage.darkThemeEnabled!,
            onToggle: (value) {
              controller.onThemeSwitchChanged(value);
            },
            activeIcon: const Icon(
              Icons.dark_mode,
              color: Colors.black,
            ),
            activeColor: DarkThemeColors.primaryColor,
            inactiveColor: DarkThemeColors.primaryColor,
            inactiveIcon: const Icon(
              Icons.light_mode,
              color: Colors.black,
            ),
            activeSwitchBorder: Border.all(color: Colors.white),
            inactiveSwitchBorder: Border.all(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
