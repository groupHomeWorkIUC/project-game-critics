import 'package:get/get_connect/http/src/response/response.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class UserRepository extends ApiProvider {
  static Future login({String? email, String? password}) async {
    String url = ApiConstants.login;
    Response response = await ApiProvider.postResponse(
        url, {'email': email, 'password': password});

    if (response.statusCode == 200) {
      UserController.setAccessToken(response.body['access_token']);
    }
    return response;
  }

  static Future signUp(
      {String? email, String? userName, String? password, String? name}) async {
    String url = ApiConstants.register;
    Response response = await ApiProvider.postResponse(url, {
      'email': email,
      'username': 'userName',
      'name': name,
      'password': password
    });

    if (response.statusCode == 200) {
      UserController.setAccessToken(response.body['access_token']);
    }
    return response;
  }
}
