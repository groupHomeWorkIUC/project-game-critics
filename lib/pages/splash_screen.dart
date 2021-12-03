import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/widgets/custom_primary_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: PrimaryButton(
          onPressed: () {
            Get.offNamed(RouteConstants.login);
          },
          text: 'Go to Home page',
        ),
      ),
    );
  }
}
