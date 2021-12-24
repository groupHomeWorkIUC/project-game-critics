import 'package:get/get.dart';
import 'package:project_game_critics/constants/api_constants.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/repository/api_provider.dart';

class CommentRepository {
  static Future sendComment(
      {required String? content, required int newsId}) async {
    return await ApiProvider.postResponse(ApiConstants.comments, {
      "content": content,
      "user_id": UserController.user!.id,
      "news_id": newsId
    });
  }

  static Future sendGameComment(
      {required String? content, required int gameId, num? rating}) async {
    return await ApiProvider.postResponse(ApiConstants.gameComments, {
      "content": content,
      "user_id": UserController.user!.id,
      "game_id": gameId,
      "rating": rating
    });
  }
}
