import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_game_critics/controllers/global_controller/user_controller.dart';
import 'package:project_game_critics/helpers/logger.dart';
import 'package:project_game_critics/models/comment.dart';
import 'package:project_game_critics/models/news.dart';
import 'package:project_game_critics/repository/comment_repository.dart';
import 'package:project_game_critics/repository/news_repository.dart';

class NewsDetailsController extends GetxController {
  TextEditingController commentFieldController = TextEditingController();
  final newsCommentFormKey = GlobalKey<FormState>();
  List<Comment>? comments = [];

  News? news;
  final data = Get.arguments;

  Future sendYourComment(String? content) async {
    final response = await CommentRepository.sendComment(
        content: content, newsId: news!.id!);

    if (response.body['message'] == 'success') {
      Get.snackbar('Message', 'You have successfully sent your comment!');
      commentFieldController.clear();
      refreshComments();
    }
  }

  Future getNewsDetail() async {
    news = await NewsRepository.getNewsDetail(data['news'].id);
    comments = news!.comments;
    return news;
  }

  refreshComments() async {
    await getNewsDetail();
    LogHelper.infoLog(news!.toJson());
    update();
  }

  onPressedSendComment() async {
    if (newsCommentFormKey.currentState!.validate() &&
        UserController.user != null) {
      await sendYourComment(commentFieldController.value.text);
    }
  }
}
