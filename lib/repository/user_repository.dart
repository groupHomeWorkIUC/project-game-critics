import 'package:get/get_connect/http/src/response/response.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/storage.dart';
import 'package:project_game_critics/models/user.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class UserRepository extends ApiProvider {
  static Future login({User? user}) async {
    String url = ApiConstants.login;
    Response response = await ApiProvider.postResponse(url, user!.loginForm());
    print(user.loginForm());

    if (response.statusCode == 200) {
      UserController.setAccessToken(response.body['access_token']);
      Storage.setAccessToken(UserController.getAccessToken()!);
    }
    return response;
  }

  static Future signUp({User? user}) async {
    String url = ApiConstants.register;
    Response response =
        await ApiProvider.postResponse(url, user!.registerForm());

    if (response.statusCode == 200) {
      UserController.setAccessToken(response.body['access_token']);
    }
    return response;
  }
}
