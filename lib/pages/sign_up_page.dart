import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/home_page_controller.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/password_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(right: 20, left: 20),
        child: Form(
          key: userController.signUpFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomInputField(
                inputFieldText: TranslateHelper.email,
                inputFieldIcon: Icons.email,
                controller: userController.emailController,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                inputFieldText: TranslateHelper.name,
                inputFieldIcon: Icons.person,
                controller: userController.nameController,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                inputFieldText: TranslateHelper.userName,
                inputFieldIcon: Icons.supervised_user_circle,
                controller: userController.userNameController,
              ),
              const SizedBox(height: 10),
              PasswordField(
                textEditingController: userController.passwordController,
              ),
              const SizedBox(height: 10),
              PasswordField(
                textEditingController: userController.passwordAgainController,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: TranslateHelper.signUp,
                onPressed: () async {
                  userController.signUp();
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Get.offNamed('/Login');
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
