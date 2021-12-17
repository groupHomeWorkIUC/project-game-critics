import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/screen_controller/signup_page_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/password_field.dart';

class SignUpPage extends GetView<SignupPageController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Form(
          key: controller.signUpFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                inputFieldText: TranslateHelper.email,
                inputFieldIcon: Icons.email,
                controller: controller.emailController,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                inputFieldText: TranslateHelper.name,
                inputFieldIcon: Icons.person,
                controller: controller.nameController,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                inputFieldText: TranslateHelper.userName,
                inputFieldIcon: Icons.supervised_user_circle,
                controller: controller.userNameController,
              ),
              const SizedBox(height: 10),
              PasswordField(
                textEditingController: controller.passwordController,
              ),
              const SizedBox(height: 10),
              PasswordField(
                textEditingController: controller.passwordAgainController,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: TranslateHelper.signUp,
                onPressed: () async {
                  controller.signUp();
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.offNamed(RouteConstants.login);
                },
                child: Text(
                  TranslateHelper.alreadyHaveAnAccount,
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
