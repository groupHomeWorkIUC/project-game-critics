import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';

class ProfileInfoPageController extends GetxController {
  String? name = UserController.user!.name;
  String? userName = UserController.user!.username;
}