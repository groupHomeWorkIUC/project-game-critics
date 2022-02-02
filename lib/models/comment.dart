import 'package:project_game_critics/models/user.dart';

class Comment {
  int? id;
  String? content;
  num? rating;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comment(
      {this.id,
      this.content,
      this.rating,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    rating = json['rating'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['rating'] = rating;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
