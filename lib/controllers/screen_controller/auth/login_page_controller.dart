import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/models/user.dart';
import 'package:project_game_critics/repository/user_repository.dart';

class LoginPageController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  //Login Controllers
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Map loginBody() {
    return {
      'email': loginEmailController.value.text,
      'password': loginPasswordController.value.text
    };
  }

  Future login() async {
    Response? response;

    if (loginFormKey.currentState!.validate()) {
      response = await UserRepository.login(body: loginBody());
      if (response!.statusCode == 200) {
        UserController.user = User.fromJson(response.body['user']);
        UserController.setAccessToken(
            response.body['token']['original']['access_token']);
        Storage.setAccessToken(
            response.body['token']['original']['access_token']);
        Storage.setUser(UserController.user!);
        Get.snackbar("Message", "Successfully logged in");
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Failed to login", "Wrong email or password!");
      }
    }
    return response;
  }

  void continueWithoutLogin() {
    Get.offAllNamed(RouteConstants.home);
  }
}
