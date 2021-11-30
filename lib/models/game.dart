import 'package:project_game_critics/models/image.dart';

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
  List<ImageModel>? images;

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
      this.images});

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
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images!.add(ImageModel.fromJson(v));
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
    data['company_id'] = companyId;
    data['release_date'] = releaseDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
