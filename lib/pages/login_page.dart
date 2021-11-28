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
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50, right: 20, left: 20),
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
            const SizedBox(height: 30),
            PrimaryButton(
              text: TranslateHelper.login,
              onPressed: controller.login,
            ),
            const SizedBox(height: 30),
            Text(
              TranslateHelper.dontHaveAnAccountSignUp,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 30),
            Text(
              TranslateHelper.continueWithoutLogin,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
