import 'dart:convert';

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

    var list = response.body['data'] as List;
    List<News> newsList = list.map((e) => News.fromJson(e)).toList();
    return newsList;
  }

  static Future<News> getNewsDetail(int id) async {
    Response response =
        await ApiProvider.getResponse(ApiConstants.news + '/' + id.toString());
    return News.fromJson(response.body);
  }
}
