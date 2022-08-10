class TodoListJson {
  int? id;
  String? title;
  String? description;
  bool? completed;
  String? color;
  String? publishedAt;
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;

  TodoListJson(
      {this.id,
      this.title,
      this.description,
      this.completed,
      this.color,
      this.publishedAt,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  TodoListJson.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    description = json["description"];
    completed = json["completed"];
    color = json["color"];
    publishedAt = json["published_at"];
    createdBy = json["created_by"];
    updatedBy = json["updated_by"];
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
    data["published_at"] = publishedAt;
    data["created_by"] = createdBy;
    data["updated_by"] = updatedBy;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
