import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/auth/profile_page_controller.dart';

class ProfilePage extends GetView<ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilePageController>(builder: (_) {
      return Scaffold(
        body: Container(
          child: Text('Profile Page'),
        ),
      );
    });
  }
}
