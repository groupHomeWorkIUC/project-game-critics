import 'package:project_game_critics/models/comment.dart';
import 'package:project_game_critics/models/image.dart';
import 'package:project_game_critics/models/store.dart';

class Game {
  int? id;
  String? name;
  String? content;
  String? tags;
  String? slug;
  int? companyId;
  String? releaseDate;
  String? createdAt;
  String? updatedAt;
  List<Store>? stores;
  List<ImageModel>? images;
  List<Comment>? comments;
  num? rating;

  Game(
      {this.id,
      this.name,
      this.content,
      this.tags,
      this.slug,
      this.companyId,
      this.releaseDate,
      this.createdAt,
      this.updatedAt,
      this.images,
      this.stores,
      this.comments,
      this.rating});

  Game.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    tags = json['tags'];
    slug = json['slug'];
    companyId = json['company_id'];
    releaseDate = json['release_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    rating = json['rating'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments!.add(Comment.fromJson(v));
      });
    }
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((v) {
        stores!.add(Store.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['tags'] = tags;
    data['slug'] = slug;
    data['rating'] = rating;
    data['company_id'] = companyId;
    data['release_date'] = releaseDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    if (stores != null) {
      data['stores'] = stores!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
