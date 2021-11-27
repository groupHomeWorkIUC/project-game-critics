import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/login_controller.dart';
import 'package:project_game_critics/helpers/themes/colors.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/input_field.dart';

class LoginPage extends GetView<LoginController> {
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
              inputFieldIcon: Icon(
                Icons.email,
                color: DarkThemeColors.greyTextColor,
                size: 20.0,
              ),
            ),
            const SizedBox(height: 10),
            CustomInputField(
              inputFieldText: TranslateHelper.name,
              inputFieldIcon: Icon(
                Icons.person,
                color: DarkThemeColors.greyTextColor,
                size: 20.0,
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}
