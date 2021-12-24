import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class NewsRepository extends ApiProvider {
  static Future getHomeNews(
      {String? take, String? page, String? orderBy}) async {
    Response response = await ApiProvider.getResponse(ApiConstants.news,
        query: {
          'take': take ?? "10",
          'page': page ?? "1",
          'order_by': orderBy ?? "false"
        });
    List<News> newsList = [];
    for (var item in response.body['data']) {
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
