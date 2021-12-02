import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/models/user.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class UserController extends GetxController {
  User? user;
  Future login({String? email, String? password}) async {
    String url = ApiConstants.login;
    Response response = await ApiProvider.postResponse(
        url, {'email': email, 'password': password});
    return response;
  }

  Future signUp({String? email, String? password, String? name}) async {
    String url = ApiConstants.users;
    Response response = await ApiProvider.postResponse(
        url, {'email': email, 'name': name, 'password': password});
    return response;
  }
}
