import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class NewsRepository extends ApiProvider {
  Future getHomeNews() async {
    Response response =
        await getResponse(ApiConstants.news, query: {'limit': "10"});
    List<News> newsList = [];
    for (var item in response.body) {
      newsList.add(News.fromJson(item));
    }
    return newsList;
  }
}
