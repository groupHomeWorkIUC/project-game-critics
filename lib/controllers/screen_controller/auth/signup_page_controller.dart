import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/repository/user_repository.dart';

class SignupPageController extends GetxController {
  final signUpFormKey = GlobalKey<FormState>();

  //Signup Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  void setUser() {
    UserController.user!.email = emailController.value.text;
    UserController.user!.name = nameController.value.text;
    UserController.user!.username = userNameController.value.text;
    UserController.user!.password = passwordController.value.text;
  }

  Future signUp() async {
    if (signUpFormKey.currentState!.validate() &&
        passwordAgainController.value.text == passwordController.value.text) {
      setUser();
      Response response =
          await UserRepository.signUp(user: UserController.user!);

      if (response.statusCode == 200) {
        Get.offAllNamed(RouteConstants.home);
      } else {
        Get.snackbar("Error", TranslateHelper.couldntSignUpPleaseTryAgain);
      }
    } else {
      Get.snackbar("Error", "Please check your password");
    }
  }
}
