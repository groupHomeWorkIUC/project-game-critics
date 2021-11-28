import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/login_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/password_field.dart';

class LoginPage extends GetView<LoginController> {
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                inputFieldText: TranslateHelper.email,
                inputFieldIcon: Icons.email,
              ),
              const SizedBox(height: 10),
              const PasswordField(),
              const SizedBox(height: 20),
              PrimaryButton(
                text: TranslateHelper.login,
                onPressed: controller.login,
              ),
              const SizedBox(height: 20),
              TextButton(
                child: Text(TranslateHelper.dontHaveAnAccountSignUp,
                    style: Theme.of(context).textTheme.bodyText1),
                onPressed: () {
                  Get.offNamed('/Signup');
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
    );
  }
}
