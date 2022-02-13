import 'package:get/get.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/company_repository.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class HomeTabController extends GetxController {
  List<News> homeNews = [];
  List<Company> companies = [];
  bool isLoading = true;

  @override
  Future onInit() async {
    super.onInit();
    await getData();
  }

  getData() async {
    homeNews = await NewsRepository.getHomeNews(orderBy: "true");
    companies = await CompanyRepository.getCompanies();

    if (homeNews.isNotEmpty || companies.isNotEmpty) {
      isLoading = false;
    }

    update();
  }
}
