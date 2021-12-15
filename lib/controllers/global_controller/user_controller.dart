import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/models/user.dart';
import 'package:project_game_critics/repository/user_repository.dart';

class UserController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();

  //Signup Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  //Login Controllers

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  static User? user;
  static String? accessToken;

  @override
  void onInit() {
    super.onInit();
    loginEmailController.text = Storage.getEmail ?? '';
  }

  Future login({String? email, String? password}) async {
    if (loginFormKey.currentState!.validate()) {
      Response response = await UserRepository.login(
          email: loginEmailController.value.text,
          password: loginPasswordController.value.text);
      if (response.statusCode == 200) {
        Storage.setEmail(loginEmailController.value.text);
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Failed to login", "Wrong email or password!");
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
        userName: userNameController.value.text,
        password: passwordController.value.text,
      );

      if (response.statusCode == 200) {
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Error", TranslateHelper.couldntSignUpPleaseTryAgain);
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
