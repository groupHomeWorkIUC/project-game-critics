import 'package:get/get.dart';
import 'package:project_game_critics/helpers/logger.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/company_repository.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class HomeTabController extends GetxController {
  List<News> homeNews = [];
  List<Company> companies = [];

  Future getData() async {
    if (homeNews.isEmpty || companies.isEmpty) {
      homeNews = await NewsRepository.getHomeNews();
      LogHelper.infoLog(homeNews.first.title);
      companies = await CompanyRepository.getCompanies();
    }
    print(companies);
    return companies;
  }
}
