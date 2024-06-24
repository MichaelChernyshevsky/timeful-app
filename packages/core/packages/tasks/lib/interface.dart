abstract class TaskInterface {
  void getTasks({required String userId}) {}
  void deleteTasks({required String taskId}) {}
  void editTasks({
    required String taskId,
    required String title,
    required String description,
    required String date,
    required String countOnDay,
    required String countOnTask,
  }) {}
  void addTasks({
    required String userId,
    required String title,
    required String description,
    required String date,
    required String countOnDay,
    required String countOnTask,
  }) {}
  void statEditTasks({required String userId, required String countDone, required String countUnDone}) {}
}
