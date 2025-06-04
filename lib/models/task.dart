class Task {
  int? id;
  String title;
  String? description;
  bool status;
  DateTime createdAt;

  Task({
    this.id,
    required this.title,
    this.description,
    required this.status,
    required this.createdAt,
  });

  // Fonction permettant de transformer mon objet en Json
  // pour pouvoir l'enregistrer dans la base
  Map<String, Object?> toMap() {
    final map = {
      'title': title,
      'description': description,
      'status': status ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
    };

    if (id != null && id != 0) {
      map['id'] = id;
    }
    return map;
  }

  // Fonction permettant de transformer les maps en objet
  // pour pouvoir les afficher dans flutter
  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'] == 1, // conversion inverse
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  static String taskToString(Task task) {
    return 'Task{id: ${task.id}, title: ${task.title}, description: ${task.description}, status: ${task.status}, createdAt: ${task.createdAt}}';
  }
}
