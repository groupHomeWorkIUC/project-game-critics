class Company {
  int? id;
  String? name;
  String? content;
  String? imageLink;
  String? slug;

  Company(
      {this.id,
      this.name,
      this.content,
      this.imageLink,
      this.slug,});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    imageLink = json['image_link'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['image_link'] = imageLink;
    data['slug'] = slug;
    return data;
  }
}