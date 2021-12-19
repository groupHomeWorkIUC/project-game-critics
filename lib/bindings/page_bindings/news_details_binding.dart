import 'package:get/get.dart';
import 'package:project_game_critics/controllers/screen_controller/news/news_details_controller.dart';

class NewsDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NewsDetailsController());
  }
}
