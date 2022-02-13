import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/constants.dart';
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
            buildAvatar(),
            const SizedBox(height: 15),
            buildInfoContainer(TranslateHelper.name, controller.name),
            const SizedBox(height: 5),
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
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText!,
            style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            rightText!,
            style: Theme.of(Get.context!).textTheme.bodyText1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  buildAvatar({String? name, Image? avatar}) {
    return Column(
      children: [
        Text(
          name ?? "İbrahim Yavuz",
          style: Theme.of(Get.context!).textTheme.headline1,
        ),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 120,
          backgroundImage: NetworkImage(
              "https://media.istockphoto.com/photos/lion-picture-id899748204?k=20&m=899748204&s=612x612&w=0&h=8hCssaAkJ0FMBpnc6_lE7-7eEGhvTf_Pa_rjojszlbg="),
        ),
      ],
    );
  }
}
