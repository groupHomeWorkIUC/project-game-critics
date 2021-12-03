import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/models/company.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class CompanyRepository {
  static Future getCompanies() async {
    Response response = await ApiProvider.getResponse(ApiConstants.companies,
        headers: {'Authorization': 'Bearer ' + UserController.accessToken!});
    List<Company> companiesList = [];
    for (var item in response.body) {
      companiesList.add(Company.fromJson(item));
    }
    return companiesList;
  }
}
