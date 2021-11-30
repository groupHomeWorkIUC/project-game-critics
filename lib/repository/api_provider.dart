import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';

class ApiProvider extends GetConnect {
  final String apiUrl = ApiConstants.apiUrl;

  Future<Response> getResponse(String url,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      String? contentType}) async {
    Response response = await get(url,
        query: query, headers: headers, contentType: contentType);
    return response;
  }

  Future<Response> postResponse(String url, dynamic body,
      {Map<String, dynamic>? query,
      Map<String, String>? headers,
      String? contentType}) async {
    Response response = await post(url, body, headers: headers, query: query);
    return response;
  }
}
