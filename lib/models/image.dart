class ImageModel {
  int? id;
  String? link;
  String? createdAt;
  String? updatedAt;

  ImageModel({this.id, this.link, this.createdAt, this.updatedAt});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['link'] = link;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
