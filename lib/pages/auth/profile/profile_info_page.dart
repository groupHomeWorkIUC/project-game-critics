import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/profile_info_page_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';

class ProfileInfoPage extends GetView<ProfileInfoPageController> {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            buildInfoContainer(TranslateHelper.name, controller.name),
            buildInfoContainer(TranslateHelper.userName, controller.userName),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Profile Info'),
    );
  }

  buildInfoContainer(String? leftText, String? rightText) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText!,
            style: Theme.of(Get.context!).textTheme.bodyText1,
          ),
          Text(
            rightText!,
            style: Theme.of(Get.context!).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
