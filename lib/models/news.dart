import 'dart:core';

import 'package:project_game_critics/models/comment.dart';
import 'package:project_game_critics/models/image.dart';

class News {
  int? id;
  String? title;
  String? content;
  String? slug;
  int? viewCount;
  String? createdAt;
  String? updatedAt;
  List<ImageModel>? images;
  List<Comment>? comments;

  News({
    this.id,
    this.title,
    this.content,
    this.slug,
    this.viewCount,
    this.createdAt,
    this.updatedAt,
    this.images,
    this.comments,
  });

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    slug = json['slug'];
    viewCount = json['view_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    /*if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments!.add(new Null.fromJson(v));
      });
    }*/
    //reactions = json['reactions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['slug'] = slug;
    data['view_count'] = viewCount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    /*if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['reactions'] = this.reactions;*/
    return data;
  }
}
