import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/profile_page_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
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
                buildContainer(TranslateHelper.logOut, Icons.logout, onPressed: controller.logOut),
                const SizedBox(height: 10),
                buildThemeSwitch(),
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
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).cardColor,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Icon(icon!, color: Theme.of(Get.context!).iconTheme.color),
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
    return FlutterSwitch(
      value: Storage.darkThemeEnabled!,
      onToggle: (value) {
        controller.onThemeSwitchChanged(value);
      },
      activeIcon: const Icon(
        Icons.dark_mode,
        color: Colors.black,
      ),
      activeColor: Theme.of(Get.context!).primaryColor,
      inactiveIcon: const Icon(
        Icons.light_mode,
        color: Colors.black,
      ),
      activeSwitchBorder: Border.all(color: Colors.white),
      inactiveSwitchBorder: Border.all(color: Colors.black),
    );
  }
}
