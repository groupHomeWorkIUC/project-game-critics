import 'dart:core';

class HomeNews {
  String? title;
  String? content;
  int? viewCount;
  String? imageUrl;

  HomeNews({this.title, this.content, this.viewCount, this.imageUrl});

  HomeNews.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    viewCount = json['view_count'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['content'] = content;
    data['view_count'] = viewCount;
    data['image_url'] = imageUrl;
    return data;
  }
}
