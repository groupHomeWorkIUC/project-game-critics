import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (Storage.getAccessToken != null) {
        UserController.setAccessToken(Storage.getAccessToken!);
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.offAllNamed(RouteConstants.login);
      }
    });
  }
}
