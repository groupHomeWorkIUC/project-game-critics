import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';

abstract class ApiProvider {
  static final GetConnect _getConnect = GetConnect();
  static String apiUrl = ApiConstants.apiUrl;

  static Future<Response> getResponse(String url,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      String? contentType}) async {
    Response response = await _getConnect.get(url,
        query: query, headers: headers, contentType: contentType);
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
