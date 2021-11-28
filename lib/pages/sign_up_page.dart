import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CustomInputField(
              inputFieldText: TranslateHelper.name,
              inputFieldIcon: Icons.person,
            ),
            const SizedBox(height: 10),
            const PasswordField(),
            const SizedBox(height: 10),
            const PasswordField(),
            const SizedBox(height: 20),
            PrimaryButton(
              text: TranslateHelper.signUp,
              onPressed: () {},
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
    );
  }
}
