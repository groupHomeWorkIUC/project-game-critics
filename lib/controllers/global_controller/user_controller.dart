import 'package:get/get.dart';
import 'package:project_game_critics/models/user.dart';

class UserController extends GetxController {
  static User? user = User();
  static String? accessToken;

  static void setAccessToken(String _accessToken) {
    accessToken = _accessToken;
  }

  static String? getAccessToken() {
    return accessToken;
  }
}
