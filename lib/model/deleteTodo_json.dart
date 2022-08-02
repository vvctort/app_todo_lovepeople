class DeleteTodoJson {
  int? id;
  String? title;
  String? description;
  bool? completed;
  String? color;
  User? user;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  DeleteTodoJson(
      {this.id,
      this.title,
      this.description,
      this.completed,
      this.color,
      this.user,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  DeleteTodoJson.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    completed = json["completed"];
    color = json["color"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    publishedAt = json["published_at"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["description"] = description;
    data["completed"] = completed;
    data["color"] = color;
    if (user != null) {
      data["user"] = user?.toJson();
    }
    data["published_at"] = publishedAt;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;
  String? provider;
  bool? confirmed;
  bool? blocked;
  int? role;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.username,
      this.email,
      this.provider,
      this.confirmed,
      this.blocked,
      this.role,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    username = json["username"];
    email = json["email"];
    provider = json["provider"];
    confirmed = json["confirmed"];
    blocked = json["blocked"];
    role = json["role"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["id"] = id;
    data["username"] = username;
    data["email"] = email;
    data["provider"] = provider;
    data["confirmed"] = confirmed;
    data["blocked"] = blocked;
    data["role"] = role;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}


