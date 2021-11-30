import 'package:get/get.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/company_repository.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class HomePageController extends GetxController {
  NewsRepository newsRepository = NewsRepository();
  CompanyRepository companyRepository = CompanyRepository();
  List<News> homeNews = [];
  List<Game> popularGames = [];
  List<Company> companies = [];

  @override
  void onInit() async {
    super.onInit();
    homeNews = await newsRepository.getHomeNews();
    companies = await companyRepository.getCompanies();
    update();
  }
}
