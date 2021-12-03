import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:project_game_critics/models/news.dart';

class NewsDetailsController extends GetxController {
  News? news;
  final data = Get.arguments;
  @override
  void onInit() async {
    super.onInit();

    if (data['news'] != null) {
      news = data['news'];
      update();
    }
  }
}
