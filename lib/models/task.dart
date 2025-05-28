class Task {
  int? id;
  final String title;
  final String content;
  final bool status;
  final DateTime createdAt;

  Task({
    this.id,
    required this.title,
    required this.content,
    required this.status,
    required this.createdAt,
  });
}
