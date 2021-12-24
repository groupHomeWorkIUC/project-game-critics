import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class UserRepository extends ApiProvider {
  static Future login({required Map body}) async {
    String url = ApiConstants.login;
    return await ApiProvider.postResponse(url, body);
  }

  static Future signUp({required Map body}) async {
    String url = ApiConstants.register;
    return await ApiProvider.postResponse(url, body);
  }
}
