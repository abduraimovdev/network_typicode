class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, Object?> json) => Todo(
        userId: json["userId"] as int,
        id: json["id"] as int,
        title: json["title"] as String,
        completed: json["completed"] as bool,
      );

  Map<String, Object?> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}
