class TasksData {
  final List<TaskData> tasks;
  TasksData(this.tasks);

  factory TasksData.fromJson(Map<String, dynamic> json) {
    print(json);
    final List<TaskData> tasks = [];
    print(json['data']);
    for (final task in json['data'] as List<dynamic>) {
      tasks.add(TaskData.fromJson(task));
    }

    return TasksData(tasks);
  }
}

class TaskData {
  final int countOnDay;
  final int countOnTask;
  final String date;
  final String description;
  final String id;
  final String title;
  final String userId;

  TaskData({
    required this.countOnDay,
    required this.countOnTask,
    required this.date,
    required this.description,
    required this.id,
    required this.title,
    required this.userId,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        countOnDay: json["countOnDay"] as int,
        countOnTask: json["countOnTask"] as int,
        date: json["date"] as String,
        description: json["description"] as String,
        id: json["id"].toString(),
        title: json["title"] as String,
        userId: json["userId"] as String,
      );
}
