import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/controllers/screen_controller/login_page_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/password_field.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.snackbar("QUIT", "Do you really want to quit?");
        return true;
      },
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomInputField(
                  controller: controller.loginEmailController,
                  inputFieldText: TranslateHelper.email,
                  inputFieldIcon: Icons.email,
                  initialValue: Storage.getEmail ?? '',
                ),
                const SizedBox(height: 10),
                PasswordField(
                  textEditingController: controller.loginPasswordController,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: TranslateHelper.login,
                  onPressed: () async {
                    await controller.login();
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  child: Text(TranslateHelper.dontHaveAnAccountSignUp,
                      style: Theme.of(context).textTheme.bodyText1),
                  onPressed: () {
                    Get.toNamed(RouteConstants.signUp);
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    TranslateHelper.continueWithoutLogin,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
