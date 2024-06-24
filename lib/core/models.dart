class EconomyModel {
  EconomyModel({
    required this.id,
    required this.title,
    required this.count,
    required this.income,
    required this.description,
    required this.date,
    required this.userId,
  });
  String id;
  String title;
  String count;
  String? description;
  int date;
  bool income;
  String userId;
}

class EconomyModels {
  EconomyModels({required this.models});
  final List<EconomyModel> models;
}

class TasksModels {
  TasksModels(this.tasks);
  final List<TaskModel> tasks;
}

class TaskModel {
  TaskModel({
    required this.countOnDay,
    required this.countOnTask,
    required this.date,
    required this.description,
    required this.id,
    required this.title,
    required this.userId,
  });

  final int countOnDay;
  final int countOnTask;
  final String date;
  final String description;
  final String id;
  final String title;
  final String userId;
}
