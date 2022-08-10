class RegisterTodoJson {
  int? id;
  String? title;
  String? description;
  bool? completed;
  String? color;
  User? user;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  RegisterTodoJson(
      {this.id,
      this.title,
      this.description,
      this.completed,
      this.color,
      this.user,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  RegisterTodoJson.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  User();

  User.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    return data;
  }
}
