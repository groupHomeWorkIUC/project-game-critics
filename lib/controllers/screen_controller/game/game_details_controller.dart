import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/logger.dart';
import 'package:project_game_critics/models/comment.dart';
import 'package:project_game_critics/models/game.dart';
import 'package:project_game_critics/repository/comment_repository.dart';
import 'package:project_game_critics/repository/game_repository.dart';

class GameDetailsController extends GetxController {
  TextEditingController commentFieldController = TextEditingController();
  final commentFormKey = GlobalKey<FormState>();

  Game? game = Game();
  final data = Get.arguments;
  List<Comment>? comments = [];
  num rating = 3;

  Future getGameDetail() async {
    game = await GameRepository.getGameDetails(data['gameId'].toString());
    comments = game!.comments ?? [];
    return game;
  }

  Future sendYourComment(String? content) async {
    final response = await CommentRepository.sendGameComment(
      content: content,
      gameId: game!.id!,
      rating: rating
    );

    if (response.body['message'] == 'success') {
      Get.snackbar('Message', 'You have successfully sent your comment!');
      commentFieldController.clear();
      refreshComments();
    }
  }

  refreshComments() async {
    await getGameDetail();
    LogHelper.infoLog(game!.toJson());
    update();
  }

  void onPressedSendComment() async {
    if (commentFormKey.currentState!.validate() &&
        UserController.user != null) {
      await sendYourComment(commentFieldController.value.text);
    }
  }
}
