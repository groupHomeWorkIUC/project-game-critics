import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/models/user.dart';
import 'package:project_game_critics/repository/user_repository.dart';

class SignupPageController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();

  //Signup Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  Map registerBody() {
    return {
      'email': emailController.value.text,
      'name': nameController.value.text,
      'username': userNameController.value.text,
      'password': passwordController.value.text,
    };
  }

  Future signUp() async {
    if (signUpFormKey.currentState!.validate() &&
        passwordAgainController.value.text == passwordController.value.text) {
      Response response = await UserRepository.signUp(body: registerBody());

      if (response.statusCode == 200) {
        UserController.user = User.fromJson(response.body['user']);
        UserController.setAccessToken(response.body['token']);
        Storage.setAccessToken(response.body['token']);
        Storage.setUser(UserController.user!);
        Get.snackbar("Message", "Successfully logged in");
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Error", TranslateHelper.couldntSignUpPleaseTryAgain);
      }
    } else {
      Get.snackbar("Error", "Please check your password");
    }
  }
}
