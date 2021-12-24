import 'package:get/get.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/models/user.dart';

class UserController extends GetxController {
  static User? user = User();
  static String? accessToken;

  @override
  void onInit() {
    super.onInit();
    user = User.fromJson(Storage.getUser());
  }

  static void setAccessToken(String _accessToken) {
    accessToken = _accessToken;
  }

  static String? getAccessToken() {
    return accessToken;
  }
}
