import 'package:get/get.dart';
import 'package:project_game_critics/constants/route_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/models/user.dart';

class ProfilePageController extends GetxController {
  logOut() {
    Storage.clearStorage();
    UserController.user = User();
    Get.offAllNamed(RouteConstants.login);
  }
}
