import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';

abstract class ApiProvider {
  static final GetConnect _getConnect = GetConnect();
  static String apiUrl = ApiConstants.apiUrl;

  static Future<Response> getResponse(String url,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      String? contentType}) async {
    Response response = await _getConnect.get(url,
        query: query,
        headers: {'Authorization': 'Bearer ' + UserController.accessToken!},
        contentType: contentType);
    return response;
  }

  static Future<Response> postResponse(String url, dynamic body,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      String? contentType}) async {
    Response response =
        await _getConnect.post(url, body, headers: headers, query: query);
    return response;
  }
}
