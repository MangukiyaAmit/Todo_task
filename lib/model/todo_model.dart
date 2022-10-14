import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) =>
    List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
  TodoModel({
    required this.id,
    required this.title,
    required this.content,
  });

  int id;
  String title;
  String content;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
      };
}
