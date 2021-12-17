class User {
  int? id;
  String? name;
  String? username;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;

  User();

  void setEmail(String? _email) {
    email = _email;
  }

  void setPassword(String? _password) {
    password = _password;
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  Map<String, dynamic> loginForm() {
    var data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }

  Map<String, dynamic> registerForm() {
    var data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
