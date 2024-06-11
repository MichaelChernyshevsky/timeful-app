import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/stat/model/task_stat.dart';
import 'package:tasks/tasks.dart';

import 'models/task_class.dart';

class TaskRepo {
  late Box<TaskModel> boxTasks;
  late Box<TaskStat> boxTasksStat;

  static const String _boxTasks = 'boxTasks';
  static const String _boxTasksStat = 'boxTasksStat';

  Future init() async {
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(TaskStatAdapter());
    await initializeStat();

    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
    validTasks();
  }

  Future initializeStat() async {
    boxTasksStat = await Hive.openBox<TaskStat>(_boxTasksStat);

    if (boxTasksStat.values.toList().isEmpty) {
      boxTasksStat.add(TaskStat.empty(date));
    }
  }

  String get date => DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).toString().split(' ')[0];

  void validTasks() {
    bool checkDate({required String str}) {
      return date == str.split('*****date*****')[0];
    }

    int done = 0;
    int undone = 0;
    if (!checkDate(str: boxTasksStat.values.first.date)) {
      final tasks = get();
      boxTasks.deleteAt(0);
      for (var index = 0; index < tasks.length; index += 1) {
        tasks[index].isDone ? done += 1 : undone += 1;
        tasks[index].isDone = false;
        boxTasks.add(tasks[index]);
      }
      final newStatModel = boxTasksStat.values.first.wipeHistory(date: date, done: done, undone: undone);
      boxTasksStat.deleteAt(0);
      boxTasksStat.add(newStatModel);
    }
  }

  TaskStat get stat => boxTasksStat.values.first;

  void changeDoneState(String id) {
    final tasks = get();
    boxTasks.deleteAt(0);
    for (var index = 0; index < tasks.length; index += 1) {
      if (tasks[index].id == id) {
        tasks[index].isDone = !tasks[index].isDone;
      }
      boxTasks.add(tasks[index]);
    }
  }

  Future wipe() async {
    await Hive.deleteBoxFromDisk(_boxTasks);
    boxTasks = await Hive.openBox<TaskModel>(_boxTasks);
    await initializeStat();
  }

  List<TaskModel> get() {
    return boxTasks.values.toList();
  }

  Future<bool> add({
    required TaskModel task,
  }) async {
    return (await boxTasks.add(task)) != -1;
  }

  Future edit({
    required TaskModel element,
    // required int index,
  }) async {
    // final elementIndex = task.id;
  }

  Future<bool> delete({
    required String id,
  }) async {
    int getIndex({required String id, required Box box}) {
      for (var index = 0; index <= box.length; index += 1) {
        if (box.values.elementAt(index).id == id) {
          return index;
        }
      }
      return -1;
    }

    final indexElement = getIndex(id: id, box: boxTasks);
    await boxTasks.deleteAt(indexElement);
    return true;
  }
}
