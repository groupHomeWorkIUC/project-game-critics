import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/translate_helper.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';
import 'package:project_game_critics/widgets/input_field.dart';
import 'package:project_game_critics/widgets/password_field.dart';

class LoginPage extends GetView<UserController> {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
            key: _formKey,
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Response response = await controller.login(
                          email: emailController.value.text,
                          password: emailController.value.text);
                      if (response.statusCode == 200) {
                        Get.offAllNamed(RouteConstants.home);
                      } else {
                        Get.snackbar(
                            "Failed to login", "Wrong email or passwor!");
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  child: Text(TranslateHelper.dontHaveAnAccountSignUp,
                      style: Theme.of(context).textTheme.bodyText1),
                  onPressed: () {},
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
