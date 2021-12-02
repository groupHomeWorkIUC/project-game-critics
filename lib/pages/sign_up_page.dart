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
  final _formKey = GlobalKey<FormState>();
  UserController userController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: emailController,
              ),
              const SizedBox(height: 10),
              CustomInputField(
                inputFieldText: TranslateHelper.name,
                inputFieldIcon: Icons.person,
                controller: nameController,
              ),
              const SizedBox(height: 10),
              PasswordField(
                controller: passwordController,
              ),
              const SizedBox(height: 10),
              PasswordField(
                controller: passwordAgainController,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: TranslateHelper.signUp,
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      passwordAgainController.value.text ==
                          passwordController.value.text) {
                    Response response = await userController.signUp(
                        email: emailController.value.text,
                        name: nameController.value.text,
                        password: passwordController.value.text);
                    if (response.statusCode == 200) {
                      Get.offAllNamed(RouteConstants.home);
                    } else {
                      Get.snackbar(
                          "Error", "Couldn't sign up, please try again");
                    }
                  } else {
                    Get.snackbar("Error", "Please check your password");
                  }
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
