class Task {
  final int id;
  String title;
  final DateTime createdAt;
  bool isDone = false;

  Task({required this.id, required this.title, required this.createdAt, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
      'isDone': isDone,
    };
  }
}
