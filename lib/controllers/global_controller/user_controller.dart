import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/models/user.dart';
import 'package:project_game_critics/repository/api_provider.dart';
import 'package:project_game_critics/repository/user_repository.dart';

class UserController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  //Login Controllers

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  static User? user;
  static String? accessToken;

  Future login({String? email, String? password}) async {
    if (loginFormKey.currentState!.validate()) {
      Response response = await UserRepository.login(
          email: loginEmailController.value.text,
          password: loginPasswordController.value.text);
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Failed to login", "Wrong email or passwor!");
      }
    }
    return UserRepository.login(email: email, password: password);
  }

  Future signUp() async {
    if (signUpFormKey.currentState!.validate() &&
        passwordAgainController.value.text == passwordController.value.text) {
      Response response = await UserRepository.signUp(
          email: emailController.value.text,
          name: nameController.value.text,
          password: passwordController.value.text);
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Error", "Couldn't sign up, please try again");
      }
    } else {
      Get.snackbar("Error", "Please check your password");
    }
  }

  static void setAccessToken(String _accessToken) {
    accessToken = _accessToken;
  }

  static String? getAccessToken() {
    return accessToken;
  }
}
