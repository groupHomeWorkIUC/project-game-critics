class Store {
  int? id;
  String? name;
  String? imageLink;
  String? createdAt;
  String? updatedAt;

  Store({
    this.id,
    this.name,
    this.imageLink,
    this.createdAt,
    this.updatedAt,
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageLink = json['image_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_link'] = imageLink;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
