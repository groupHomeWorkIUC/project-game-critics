import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class NewsRepository extends ApiProvider {
  static Future getHomeNews() async {
    Response response = await ApiProvider.getResponse(ApiConstants.news,
        query: {'limit': "10"},
        headers: {'Authorization': 'Bearer ' + UserController.accessToken!});
    List<News> newsList = [];
    for (var item in response.body) {
      newsList.add(News.fromJson(item));
    }
    return newsList;
  }

  static Future<News> getNewsDetail(int id) async {
    News news;
    Response response =
        await ApiProvider.getResponse(ApiConstants.news + '/' + id.toString());
    news = News.fromJson(response.body);
    return news;
  }
}
